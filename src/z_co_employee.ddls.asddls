@AbapCatalog.viewEnhancementCategory: [#NONE]//
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
@EndUserText.label: 'Id de empleado'
    @Search.defaultSearchElement: true
    key EmployeeId,
    @EndUserText.label: 'Nombre'
    FirstName,
    @EndUserText.label: 'Apellido'
    LastName,
    @Consumption.valueHelpDefinition: [{ 
    entity: { name: 'ZVALUEHELP_DEPARTMENT', element: 'DepartmentName' }  }]
    @EndUserText.label: 'Departamento'
    Department
    
}
