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
{
    @EndUserText.label: 'Id de asignacion'
    @Search.defaultSearchElement: true
    key AssignmentId,
     @EndUserText.label: 'Id de equipo'
    EquipmentId,
     @EndUserText.label: 'Id de empleado'
    EmployeeId,
     @EndUserText.label: 'Fecha de asignacion'
    AssignmentDate
}
