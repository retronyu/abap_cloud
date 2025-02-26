
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista consumo Z_EMPLOYEE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,//
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity Z_CO_EMPLOYEE 
 as select from Z_EMPLOYEE as Employee

{
  key EmployeeId,
    FirstName,
    LastName,
   DepartmentId,
    DepartmentName
}
