@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Solicitudes de Compra'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_PUR_REQUEST 
  as select from ztpur_request

  association [0..*] to ZC_PUR_REQUEST_ITEM as _Items 
     on $projection.RequestID = _Items.RequestID

  {
     key request_id   as RequestID,
     created_at       as CreatedAt,
     created_by       as CreatedBy,
     requested_by     as RequestedBy,
     vendor_id        as VendorID,

     @Semantics.amount.currencyCode: 'Currency'
     total_amount     as TotalAmount,
     currency         as Currency,
     status           as Status,

     _Items // Hacer pública la asociación para visualizar los ítems  
}
