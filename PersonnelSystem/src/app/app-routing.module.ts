import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { EmployeeListComponent } from './employee-list/employee-list.component'; // Import your component

const routes: Routes = [
  { path: 'employee-list', component: EmployeeListComponent }, // Define the route for your component
  { path: '', redirectTo: '/employee-list', pathMatch: 'full' }, // Redirect to the employee list by default
];


@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
