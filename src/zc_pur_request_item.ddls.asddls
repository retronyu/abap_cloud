@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Solicitudes de Compra'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_PUR_REQUEST_ITEM 
  as select from ztpur_req_item  

  association [1..1] to ZC_PUR_REQUEST as _Request  
    on $projection.RequestID = _Request.RequestID  

  {  
     key request_id   as RequestID,  
     key item_no      as ItemNo,  
     material_id      as MaterialID,  

     @Semantics.quantity.unitOfMeasure: 'Unit'  
     quantity         as Quantity,  
     unit             as Unit,  

     @Semantics.amount.currencyCode: 'Currency'  
     price            as Price,  
     currency         as Currency,  

     _Request  // Incluir la asociación para visualizar datos de la solicitud  
  }  
