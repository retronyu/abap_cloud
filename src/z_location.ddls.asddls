@AbapCatalog.sqlViewName: 'Z_LOCATION1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tabla de ubicaciones'
@Metadata.ignorePropagatedAnnotations: true

define root view Z_Location as select from zlocation_gp
association [0..*] to zequipment_gp as _Equipments on _Equipments.location_id = zlocation_gp.location_id
{
    key location_id   as LocationId,
    location_name     as LocationName,
    address           as Address,
    
    created_at        as CreatedAt,
    created_by        as CreatedBy,
      _Equipments       // Asociación a los equipos en esta ubicación
}
