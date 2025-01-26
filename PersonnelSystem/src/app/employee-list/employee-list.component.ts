import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';  // Import necessary modules
import { EmployeeService } from '../service/employee.service';  // Import the EmployeeService
import { Employee, Designation } from '../../model/Employee';  // Import the Employee model


@Component({
  selector: 'app-employee-list',
  standalone:false,
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css']
})
export class EmployeeListComponent implements OnInit {
  employees: Employee[] = []; // List of all employees
  designations: Designation[] = []; // List of all designations
  managers: Employee[] = [];  // List of managers for the dropdown
  selectedManager: Employee | null = null;  // Manager selected from dropdown
  employeesUnderManager: Employee[] = [];  // Employees filtered by selected manager

  // Add Employee form group
  isAddingEmployee = false;
  successMessage = ''; // Success message variable
  employeeForm: FormGroup;

  constructor(private employeeService: EmployeeService, private fb: FormBuilder) {
    // Initialize the form group
    this.employeeForm = this.fb.group({
      employeeID: [{ value: '', disabled: true }, Validators.required],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      designationID: ['', Validators.required],
      managerId: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    // Fetch employees from API
    this.employeeService.getEmployees().subscribe((data) => {
      this.employees = data;
      // Set the employeesUnderManager to all employees by default
      this.employeesUnderManager = this.employees;
      const employeesUnderManager = this.employees.filter(emp => emp.designationID === 1);
      this.managers = employeesUnderManager;
    });

    // Fetch designations from API
    this.employeeService.getDesignations().subscribe((data) => {
      this.designations = data;
    });
  }

  // Method called when the manager is changed from the dropdown
  onManagerChange(event: Event): void {
   
    const managerId = Number((event.target as HTMLSelectElement).value);
    console.log("onManagerChange managerId", managerId)

    if (managerId) {
      // Filter employees under the selected manager
      this.employeesUnderManager = this.employees.filter(emp => emp.managerId === managerId);
    } else {
      // If no manager selected, show all employees
      this.employeesUnderManager = this.employees;
    }
  }

  // Toggle form visibility (Add Employee)
  toggleAddEmployeeForm(): void {
    this.isAddingEmployee = !this.isAddingEmployee;
  }

  // Add new employee
  addEmployee(): void {
    console.log('addEmployee');
    if (this.employeeForm.invalid) {
      console.error('Form is invalid. Please check the fields.');
      console.table(this.employeeForm.errors); // Display form errors in the console
      return;
    }
    if (this.employeeForm.valid) {
     
      const formData = this.employeeForm.value;
      const newEmployee: Employee = {
        firstName: formData.firstName,
        lastName: formData.lastName,
        designationID: formData.designationID,
        managerId: formData.managerId
      };
      console.log('newEmployee', newEmployee);
      this.employeeService.addEmployee(newEmployee).subscribe({
        next: (response) => {
          console.log('New Employee Added:', response);
          this.employees.push(response);
          this.toggleAddEmployeeForm();
          this.successMessage = 'Successfully Added!';
          this.employeeForm.reset({
            employeeID: null,
            firstName: '',
            lastName: '',
            designation: null,
            managerId: null
          });

          setTimeout(() => (this.successMessage = ''), 5000); // Remove the message after 5 seconds
        },
        error: (error) => {
          console.error('Error adding employee:', error);
        },
      });
    }
  }

  // Update employees under the selected manager (after adding a new employee)
  updateEmployeesUnderManager(): void {
    if (this.selectedManager) {
      this.employeesUnderManager = this.employees.filter(emp => emp.managerId === this.selectedManager?.employeeID);
    } else {
      this.employeesUnderManager = this.employees;
    }
  }
}
