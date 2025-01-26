import { Component, OnInit } from '@angular/core';
import { EmployeeService } from '../service/employee.service';  // Import the EmployeeService
import { Employee } from '../../model/Employee';  // Import the Employee model

@Component({
  selector: 'app-employee-list',
  standalone: false,
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css']
})
export class EmployeeListComponent implements OnInit {
  employees: Employee[] = []; // List of all employees
  managers: Employee[] = [];  // List of managers for the dropdown
  selectedManager: Employee | null = null;  // Manager selected from dropdown
  employeesUnderManager: Employee[] = [];  // Employees filtered by selected manager
  selectedEmployee: Employee | null = null; // Selected employee for details

  constructor(private employeeService: EmployeeService) { }

  ngOnInit(): void {
    // Fetch employees from API
    this.employeeService.getEmployees().subscribe((data) => {
      this.employees = data;  
      // Set the employeesUnderManager to all employees by default
      this.employeesUnderManager = this.employees;
      const managerIds = new Set(this.employees.map(emp => emp.managerId).filter(id => id !== null));
      const managers = this.employees.filter(emp => managerIds.has(emp.employeeID));
      this.managers = managers;

    });
  }

  // Method called when the manager is changed from the dropdown
  onManagerChange(event: Event): void {
    const managerId = Number((event.target as HTMLSelectElement).value);
    if (managerId) {
      // Filter employees under the selected manager
      this.employeesUnderManager = this.employees.filter(emp => emp.managerId === managerId);
    } else {
      // If no manager selected, show all employees
      this.employeesUnderManager = this.employees;
    }
  }

  // Select employee to view details (if needed)
  selectEmployee(employee: Employee): void {
    this.selectedEmployee = employee;
  }
}
