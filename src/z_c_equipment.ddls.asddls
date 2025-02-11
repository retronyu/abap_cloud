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

{



  key Equipmentid,
      Description,
      Equipmenttype,
      Status,
      LocationId,
      Lastmaintenancedate,
      
       case Status
        when 'MNT_ACTIVO' then 1  // Rojo (Crítico)
        when 'ACTIVO' then 3       // Verde (Positivo)
        when 'INACTIVO' then 0     // Neutral
        else 2                     // Amarillo (Crítico moderado)
      end as StatusCriticality
      

}
