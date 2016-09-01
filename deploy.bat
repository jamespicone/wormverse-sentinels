@echo off

@for /R %%x in (*.bat) do (
	@if not %~f0 == %%x (
		@echo Running %%x 
		@pushd %%~dpx
		@%%x
		@popd %%~dpx))