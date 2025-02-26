@AbapCatalog.sqlViewName: 'Z_MAINTENANCE1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Historial de mantenimientos de equipos'


@Metadata.ignorePropagatedAnnotations: true
define root view Z_Maintenance as select from zmaintenance_gp
association [0..1] to zequipment_gp as _Equipment on _Equipment.equipment_id = zmaintenance_gp.equipment_id
{
    key maintenance_id as MaintenanceId,
    _Equipment.equipment_id as EquipmentId,  // Asociación en lugar de campo aislado
    _Equipment.description as EquipmentDescription, // Traer info del equipo
    maintenance_date      as MaintenanceDate,
    description           as Description,
    created_at            as CreatedAt,
    created_by            as CreatedBy
}
