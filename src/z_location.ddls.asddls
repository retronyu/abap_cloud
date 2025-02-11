@AbapCatalog.sqlViewName: 'Z_LOCATION1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tabla de ubicaciones'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_Location as select from zlocation_gp
{
    key location_id as LocationId,
    location_name as LocationName,
    address as Address
}
