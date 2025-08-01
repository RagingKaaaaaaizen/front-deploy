import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { StockService } from '../_services/stock.service';
import { ItemService } from '../_services/item.service';
import { StorageLocationService } from '../_services/storage-location.service';
import { Stock } from '../_models/stock';

@Component({
  selector: 'app-stock-edit',
  templateUrl: './stock-edit.component.html'
})
export class StockEditComponent implements OnInit {
  stock: Stock = new Stock();
  isEdit = false;
  isViewMode = false;
  items: any[] = [];
  locations: any[] = [];
  loading = false;
  error = '';
  submitted = false;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private stockService: StockService,
    private itemService: ItemService,
    private locationService: StorageLocationService
  ) {}

  ngOnInit(): void {
    this.isViewMode = this.router.url.includes('/view/');
    
    // Load items
    this.itemService.getAll().subscribe(items => {
      this.items = items.map((i: any) => ({
        id: i.id,
        name: `${i.name} (${i.category?.name || 'No Category'})`
      }));
    });

    // Load storage locations
    this.locationService.getAll().subscribe(locations => {
      this.locations = locations;
    });

    // If editing existing stock
    const id = this.route.snapshot.params['id'];
    if (id) {
      this.isEdit = true;
      this.stockService.getById(id).subscribe(stock => {
        this.stock = stock;
        this.stock.locationId = stock.location?.id;
        // Ensure totalPrice is calculated if price & quantity are present
        if (this.stock.price && this.stock.quantity) {
          this.calculateTotalPrice();
        }
      });
    } else {
      // Initialize new stock with default values
      this.stock = new Stock();
      this.stock.quantity = 1;
      this.stock.price = 0;
      this.stock.totalPrice = 0;
    }
  }

  // Calculate total price when quantity or price changes
  calculateTotalPrice() {
    const price = this.stock.price ?? 0;
    const qty = this.stock.quantity ?? 0;
    this.stock.totalPrice = price * qty;
  }

  save() {
    this.submitted = true;
    
    // Validate required fields
    if (!this.stock.itemId) {
      this.error = 'Please select an item';
      return;
    }
    if (!this.stock.locationId) {
      this.error = 'Please select a storage location';
      return;
    }
    if (!this.stock.quantity || this.stock.quantity <= 0) {
      this.error = 'Quantity must be greater than 0';
      return;
    }
    if (!this.stock.price || this.stock.price < 0) {
      this.error = 'Price must be 0 or greater';
      return;
    }

    // Auto-calculate before saving
    this.calculateTotalPrice();

    this.loading = true;
    this.error = '';

    if (this.isEdit) {
      this.stockService.update(this.stock.id!, this.stock).subscribe({
        next: () => {
          this.loading = false;
          this.router.navigate(['/stocks']);
        },
        error: (error) => {
          this.loading = false;
          this.error = 'Error updating stock: ' + (error.error?.message || error.message || 'Unknown error');
        }
      });
    } else {
      this.stockService.create(this.stock).subscribe({
        next: (result) => {
          this.loading = false;
          this.router.navigate(['/stocks']);
        },
        error: (error) => {
          this.loading = false;
          this.error = 'Error creating stock: ' + (error.error?.message || error.message || 'Unknown error');
        }
      });
    }
  }
}
