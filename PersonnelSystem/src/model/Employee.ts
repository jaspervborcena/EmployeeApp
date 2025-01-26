// shared/employee-detail.ts

export interface Employee {
  employeeID: number;
  lastName: string;
  firstName: string;
  managerId?: number;
  Designation: any;
}
export interface Designation {
  designationID: number;
  title: string;
  description: string;
}
