@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for Employee'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZVALUEHELP_EMPLOYEE as select from zemployeee_gp
{
  key employee_id as EmployeeId,
  first_name as FirstName,
  last_name as LastName,
  department as Department
}
