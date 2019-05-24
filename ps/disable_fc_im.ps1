$adapters = Get-NetAdapter -Physical

foreach ($adapter in $adapters) {
   $params = & {
      Get-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Flow Control"
      Get-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Interrupt Moderation"
   }
   foreach($param in $params) {
      Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName $param.DisplayName -DisplayValue "Disabled"
   }
}