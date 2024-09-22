@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_SAD_MITARBEITER
  provider contract TRANSACTIONAL_QUERY
  as projection on ZI_SAD_MITARBEITER
{
  key Id,
  Vollname,
  Rolle,
  Steuertarif,
  Gehalt,
  WieAlt,
  Erfahrung,
  Kinder,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt
  
}
