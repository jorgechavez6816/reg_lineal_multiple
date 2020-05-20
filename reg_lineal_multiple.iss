Sub Main
	IgnoreWarning(True)
	Call PivotTable()	'Ejemplo-Detalle de ventas.IMD
	Call ExportDatabaseXLSX()	'Tabladin�mica01.IMD
	Client.RefreshFileExplorer
	Client.RunPython "C:\Users\Intel\Documents\Mis documentos IDEA\Samples\Macros.ILB\reg_lineal_multiple.py"
End Sub


' An�lisis: Tabla din�mica
Function PivotTable
	Set db = Client.OpenDatabase("Ejemplo-Detalle de ventas.IMD")
	Set task = db.PivotTable
	task.ResultName = "Tabladin�mica1"
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
	Set db = Client.OpenDatabase("Tabladin�mica1.IMD")
	Set task = db.ExportDatabase
	task.IncludeAllFields
	eqn = ""
	task.PerformTask "C:\Users\Intel\Documents\Mis documentos IDEA\Samples\Exportaciones.ILB\Tabladin�mica1.XLSX", "Database", "XLSX", 1, db.Count, eqn
	Set db = Nothing
	Set task = Nothing
End Function