@AbapCatalog.sqlViewName: 'ZEQUIPMENT1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tabla de equipos'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_Equipment
  as select from zequipment_gp
  association [0..1] to zlocation_gp as _Location on _Location.location_id = zequipment_gp.location_id
association [0..*] to zmaintenance_gp as _Maintenances on _Maintenances.equipment_id = zequipment_gp.equipment_id
{
 key  equipment_id        as EquipmentId,
       description         as Description,
       equipmenttype       as EquipmentType,
       status              as Status,

       _Location.location_id  as LocationId,  
       _Location.location_name as LocationName,  // Información de la ubicación
       
       lastmaintenancedate as LastMaintenanceDate,

       created_at          as CreatedAt,
       created_by          as CreatedBy,

       _Maintenances       // Asociación al historial de mantenimientos
}

//
