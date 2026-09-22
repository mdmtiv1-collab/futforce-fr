@echo off
title Espace Membres VIP FUTFORCE - Serveur Local
echo =======================================================
echo     Espace Membres VIP FUTFORCE - Serveur Local
echo =======================================================
echo.
echo URL d'accès : http://localhost:8092/area-de-membros.html
Gardez cette fenêtre ouverte pendant votre utilisation.
Ouverture dans votre navigateur...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "& { cd '%~dp0'; $http = [System.Net.HttpListener]::new(); $http.Prefixes.Add('http://localhost:8092/'); $http.Start(); Start-Process 'http://localhost:8092/area-de-membros.html'; while ($http.IsListening) { $context = $http.GetContext(); $request = $context.Request; $response = $context.Response; $path = $request.Url.LocalPath; if ($path -eq '/') { $path = '/area-de-membros.html' }; $localPath = Join-Path $pwd.Path $path; if (Test-Path $localPath -PathType Leaf) { $bytes = [System.IO.File]::ReadAllBytes($localPath); $response.ContentLength64 = $bytes.Length; if ($path.EndsWith('.html')) { $response.ContentType = 'text/html; charset=utf-8' } elseif ($path.EndsWith('.css')) { $response.ContentType = 'text/css' } elseif ($path.EndsWith('.js')) { $response.ContentType = 'application/javascript' } elseif ($path.EndsWith('.png')) { $response.ContentType = 'image/png' } elseif ($path.EndsWith('.jpg') -or $path.EndsWith('.jpeg')) { $response.ContentType = 'image/jpeg' } elseif ($path.EndsWith('.webp')) { $response.ContentType = 'image/webp' }; $response.OutputStream.Write($bytes, 0, $bytes.Length) } else { $response.StatusCode = 404 }; $response.OutputStream.Close() } }"
