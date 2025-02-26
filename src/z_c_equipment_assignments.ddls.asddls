@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'vista incluye equipos y asignaciones'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root  view entity Z_C_EQUIPMENT_ASSIGNMENTS
  as select from Z_Equipment
  association [0..1] to Z_Location    as _Location    on $projection.LocationId= _Location.LocationId
association [0..*] to Z_Assignment  as _Assignments on $projection.EquipmentId = _Assignments.EquipmentId
  association [0..*] to Z_Maintenance as _Maintenances on $projection.EquipmentId = _Maintenances.EquipmentId
{
   @Search.defaultSearchElement: true
   
  key EquipmentId,
      Description,
      EquipmentType,
      Status,
      LocationId,
    _Location.LocationName,
    _Location.Address,
      _Assignments.AssignmentId,
      _Assignments.EmployeeId,
      _Assignments.AssignmentDate,
      _Maintenances.MaintenanceId,
      _Maintenances.MaintenanceDate,
      _Maintenances.Description as Descripcion

}
