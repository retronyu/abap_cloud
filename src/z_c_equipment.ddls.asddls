@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista consumo z_equipment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity Z_C_EQUIPMENT
  as select from Z_Equipment

association [0..1] to Z_Location as _Location on $projection.LocationId = _Location.LocationId
  association [0..1] to Z_Maintenance as _LastMaintenance on $projection.EquipmentId = _LastMaintenance.EquipmentId
{
  key EquipmentId,
      Description,
      EquipmentType,
      Status,
      LocationId,
      LastMaintenanceDate,

      _Location.LocationName,
      _Location.Address,

      _LastMaintenance.Description as LastMaintenanceDescription,

      case Status
        when 'MNT' then 1  // Rojo (Crítico) - En Mantenimiento
        when 'ACT' then 3   // Verde (Positivo) - En Uso
        when 'INA' then 0   // Neutral - Fuera de Servicio
        else 2              // Amarillo (Moderado)
      end as StatusCriticality
}
