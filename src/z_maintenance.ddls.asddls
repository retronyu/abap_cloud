@AbapCatalog.sqlViewName: 'Z_MAINTENANCE1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tabla de mantenimientos (historial de servicios).'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_Maintenance as select from zmaintenance_gp
{
    key maintenance_id as MaintenanceId,
    equipment_id as EquipmentId,
    maintenance_date as MaintenanceDate,
    description as Description
}
