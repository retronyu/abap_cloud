@AbapCatalog.sqlViewName: 'Z_I_BOOKING1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view from /DMO/I_BOOKING_U'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

define view Z_I_BOOKING_R_GP1
  as select from /DMO/I_Booking_U as Booking
 // association        to parent Z_I_TRAVEL_R_GP as _Travel     on $projection.TravelID = _Travel.TravelID
  association [1..1] to /DMO/I_Connection      as _Connection on $projection.ConnectionID = _Connection.ConnectionID

{
  key TravelID,
  key BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      //  @Semantics.amount.currencyCode: 'Currency_Code'
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      concat_with_space(cast(_Connection.Distance as abap.char(11)) ,_Connection.DistanceUnit,1)as DistanceC,
     
      @Semantics.unitOfMeasure: true
      _Connection.DistanceUnit as DistanceUnit,
      case
      when _Connection.Distance >= 2000 then 'Vuelo de Larga distancia'
      when _Connection.Distance >= 1000 and
      _Connection.Distance <  2000 then 'Vuelo de Media distancia'
      when _Connection.Distance <  1000 then 'Vuelo de Corta distancia'
                      else 'error'
      end                      as Flight_type,


      /* Associations */
      _BookSupplement,
      _Carrier,
      _Connection,
      _Customer,
      _Travel
}
where
_Connection.DistanceUnit = 'KM'
