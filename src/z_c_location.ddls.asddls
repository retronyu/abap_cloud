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
define root view entity Z_C_LOCATION
   as select from Z_Location

{
      @EndUserText.label: 'Id de Ubicacion'
      @Search.defaultSearchElement: true
  key LocationId,
      @EndUserText.label: 'Nombre de Ubicacion'
      LocationName,
      @EndUserText.label: 'Direccion'
      Address
}
