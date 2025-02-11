@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Model View Entity - Read Only'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Z_I_TRAVEL_R_GP
  as select from /DMO/I_Travel_U as Travel
 // composition [0..*] of Z_I_BOOKING_R_GP1 as _Booking
  association [1..1] to /DMO/I_Agency   as _Agency   on $projection.AgencyID = _Agency.AgencyID
  association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID



{


  key TravelID,
  
      @Consumption.valueHelpDefinition: [{  entity: {name: '/DMO/I_Agency', element: 'AgencyID'}  }]
      @ObjectModel.text.association: '_Agency'
      AgencyID,
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer', element: 'CustomerID' }}]

      @ObjectModel.text.association: '_Customer'
      CustomerID,

      concat_with_space(_Customer.Title, _Customer.LastName, 1) as Addressee,

      BeginDate,

      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'

      TotalPrice,
      CurrencyCode,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.70

      Memo,
      Status,
      LastChangedAt,

 //Currency Conversion
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
      amount => TotalPrice,
      source_currency => CurrencyCode,
      round => 'X',
      target_currency => cast('USD' as abap.cuky( 5 )),
      exchange_rate_date => cast('20200429' as abap.dats),
      error_handling => 'SET_TO_NULL' )                         as PriceInUSD,
      
      /* Associations */
      _Agency,
      _Booking,
      _Currency,
      _Customer,
      _TravelStatus

}


//esta anotación indica que el campo al que se aplica representa una cantidad monetaria @Semantics.amount.currencyCode: 'CurrencyCode'

//@Search.searchable: true     Propósito: Esta anotación se utiliza para habilitar la capacidad de búsqueda en toda la vista CDS.

//@Search.fuzzinessThreshold: 0.90
//Propósito: Esta anotación se utiliza para definir el umbral de imprecisión para la búsqueda difusa.
//Uso: La búsqueda difusa permite encontrar coincidencias que no son exactas, lo que es útil cuando los usuarios pueden cometer errores tipográficos o cuando buscan términos similares. El valor del umbral (entre 0 y 1) determina cuán permisiva es la búsqueda. Un valor de 0.90 significa que la búsqueda debe ser bastante precisa, mientras que un valor más bajo permitiría coincidencias más imprecisas.

//@Consumption.valueHelpDefinition se utiliza para proporcionar ayuda de valor (value help) a un campo en una vista CDS entity: Especifica la entidad que contiene los valores que se utilizarán para la ayuda de valor.
//name: El nombre de la entidad que proporciona los valores de ayuda.
//element: El campo dentro de esa entidad que contiene los valores que se mostrarán en la ayuda de valor.

//association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
//Propósito: Esta declaración crea una relación entre dos entidades CDS, permitiendo que una entidad acceda a los datos de otra entidad relacionada.
//Define una asociación entre dos entidades. [1..1] indica que hay una relación de uno a uno entre las entidades

//concat_with_space se utiliza para concatenar (fusionar) dos cadenas de texto, añadiendo un espacio entre ellas. Esto es útil cuando quieres combinar dos campos de texto en uno solo para mejorar la legibilidad de los datos.

//Propósito de composition [0..*] of Z_I_BOOKING_000 as _Booking 
 //La palabra clave composition se utiliza para definir una relación de composición entre dos entidades. En una relación de composición, la entidad "hija" (en este caso, Z_I_BOOKING_000) depende completamente de la entidad "padre" (en este caso, Z_I_TRAVEL_R_000). Si se elimina la entidad "padre", todas las entidades "hijas" asociadas también se eliminan.
//[0..*]: Este rango indica que una entidad "padre" (Z_I_TRAVEL_R_000) puede tener cero o más entidades "hijas" (Z_I_BOOKING_000). Es decir, un viaje puede tener ninguna, una o varias reservas asociadas.
//of Z_I_BOOKING_000: Especifica la entidad "hija" en la relación de composición. En este caso, la entidad "hija" es Z_I_BOOKING_000.
//as _Booking: Asigna un alias (_Booking) a la entidad "hija" para usarlo en la vista CDS.
