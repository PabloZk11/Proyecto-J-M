<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\Usuario;


class UsuarioTest extends TestCase
{
    use RefreshDatabase;

    public function test_listados_usuarios()
    {
        $this->runTestSafe(function () {
            $usuarios = Usuario::factory()->count(5)->create();

            $response = $this->getJson('/api/usuario');

            $response->assertStatus(200);

            $response->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    '*' => [
                        'id_usuario',
                        'nombre',
                        'email',
                        'id_rol',
                        'id_documento'
                    ]
                ]
            ]);

            $responseData = $response->json('data');
            $this->assertCount(5, $responseData);
        });
    }

    public function test_actualizar_usuario()
    {
        $this->runTestSafe(function () {
            // Crear un usuario
            $usuario = usuario::factory()->create([
                'nombre' => 'Juan',
                'apellido' => 'Perez',
                'email' => 'juan@example.com',
                'password' => bcrypt('password123'),
                'id_rol' => 1,
                'id_documento' => 1
            ]);

           
            $data = [
                'nombre' => 'Juan Actualizado',
                'apellido' => 'Perez Actualizado',
                'email' => 'juan_actualizado@example.com',
                'password' => bcrypt('password456'),
                'id_rol' => 2,
                'id_documento' => 2
            ];

          
            $response = $this->putJson("/api/usuario/{$usuario->id_usuario}", $data);

         
            $response->assertStatus(200);

           
            $this->assertDatabaseHas('usuario', [
                'id_usuario' => $usuario->id_usuario,
                'nombre' => 'Juan Actualizado',
                'apellido' => 'Perez Actualizado',
                'email' => 'juan_actualizado@example.com',
                'id_rol' => 2,
                'id_documento' => 2
            ]);
        });
    }
}
