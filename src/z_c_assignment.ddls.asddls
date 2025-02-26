@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista consumo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity Z_C_ASSIGNMENT  as select from Z_Assignment
 association [0..1] to Z_Equipment as _Equipment on $projection.EquipmentId = _Equipment.EquipmentId
  association [0..1] to Z_EMPLOYEE as _Employee on $projection.EmployeeId = _Employee.EmployeeId
{
    @EndUserText.label: 'Id de asignación'
    @Search.defaultSearchElement: true
    key AssignmentId,

    @EndUserText.label: 'Id de equipo'
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZVALUEHELP_EQUIPMENT', element: 'EquipmentId' } }]
    EquipmentId,
    
    @EndUserText.label: 'Descripción del equipo'
    _Equipment.Description,

    @EndUserText.label: 'Id de empleado'
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZVALUEHELP_EMPLOYEE', element: 'EmployeeId' } }]
    EmployeeId,

    @EndUserText.label: 'Nombre del empleado'
    _Employee.FirstName,

    @EndUserText.label: 'Apellido del empleado'
    _Employee.LastName,

    @EndUserText.label: 'Fecha de asignación'
    AssignmentDate
}
