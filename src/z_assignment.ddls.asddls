@AbapCatalog.sqlViewName: 'Z_ASSIGNMENT1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'abla de asignaciones'
@Metadata.ignorePropagatedAnnotations: true

define root view Z_Assignment as select from zassignment_gp
{
    key assignment_id as AssignmentId,
    equipment_id as EquipmentId,
    employee_id as EmployeeId,
    assignment_date as AssignmentDate
}
