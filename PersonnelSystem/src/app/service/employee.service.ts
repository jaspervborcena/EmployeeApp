import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Employee } from '../../model/Employee';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {
  private apiUrl = 'http://localhost:5000/api/employee';  // Replace with your actual API URL
  private designationApiUrl = 'http://localhost:5000/api/designation';
  constructor(private http: HttpClient) { }

  // Get all employees
  getEmployees(): Observable<Employee[]> {
    return this.http.get<Employee[]>(this.apiUrl);
  }

  // Add a new employee
  //addEmployee(employee: Employee): Observable<Employee> {
  //  return this.http.post<Employee>(this.apiUrl, employee);
  //}
  getDesignations(): Observable<any[]> {
    return this.http.get<any[]>(this.designationApiUrl);
  }

  addEmployee(employee: Employee): Observable<Employee> {
    const headers = new HttpHeaders({ 'Content-Type': 'application/json' });
    return this.http.post<Employee>(this.apiUrl, employee, { headers });
  }
}
