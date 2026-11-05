@echo off
rem Double-click to open the Trigger Board at http://localhost:8787/
rem Starts the local server hidden if it is not already running.
powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0serve-dashboard.ps1"
