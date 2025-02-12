@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección de Solicitudes de Compra'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_PUR_REQUEST_P  
  as projection on ZC_PUR_REQUEST 
{
     key RequestID,
     CreatedAt,
     CreatedBy,
     RequestedBy,
     VendorID,

     @Semantics.amount.currencyCode: 'Currency'
     TotalAmount,
     Currency,
     Status,

     _Items // Exponer la asociación a los ítems
}
