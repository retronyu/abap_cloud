@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for department'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZVALUEHELP_DEPARTMENT as select from zdepartment_gp
{
    key department_id as DepartmentId,
    department_name as DepartmentName,
    description as Description
    
}
