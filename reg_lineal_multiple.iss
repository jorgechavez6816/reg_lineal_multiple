Sub Main
	IgnoreWarning(True)
	Call PivotTable()	'Ejemplo-Detalle de ventas.IMD
	Call ExportDatabaseXLSX()	'Tabladinámica01.IMD
	Client.RefreshFileExplorer
	Client.RunPython "C:\Users\Intel\Documents\Mis documentos IDEA\Samples\Macros.ILB\reg_lineal_multiple.py"
End Sub


' Análisis: Tabla dinámica
Function PivotTable
	Set db = Client.OpenDatabase("Ejemplo-Detalle de ventas.IMD")
	Set task = db.PivotTable
	task.ResultName = "Tabladinámica1"
	task.AddRowField "NUM_VENDEDOR"
	task.AddColumnField "COD_PROD"
	task.AddDataField "TOTAL", "Suma: TOTAL", 1
	task.ExportToIDEA True
	task.PerformTask
	Set task = Nothing
	Set db = Nothing
End Function

' Archivo-Exportar base de datos: XLSX
Function ExportDatabaseXLSX
	Set db = Client.OpenDatabase("Tabladinámica1.IMD")
	Set task = db.ExportDatabase
	task.IncludeAllFields
	eqn = ""
	task.PerformTask "C:\Users\Intel\Documents\Mis documentos IDEA\Samples\Exportaciones.ILB\Tabladinámica1.XLSX", "Database", "XLSX", 1, db.Count, eqn
	Set db = Nothing
	Set task = Nothing
End Function