@AbapCatalog.sqlViewName: 'ZEQUIPMENT1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tabla de equipos'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_Equipment
  as select from zequipment_gp
{
  key  equipment_id        as Equipmentid,
       description         as Description,
       equipmenttype       as Equipmenttype,
       status              as Status,
       location_id          as LocationId,
       lastmaintenancedate as Lastmaintenancedate
}
//
