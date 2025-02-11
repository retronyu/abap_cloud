@AbapCatalog.sqlViewName: 'Z_EMPLOYEE1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VISTA BASE PARA EMPLEADOS'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_EMPLOYEE
  as select from zemployeee_gp


{
  key employee_id as EmployeeId,
      first_name  as FirstName,
      last_name   as LastName,
 
     department  as Department


}
