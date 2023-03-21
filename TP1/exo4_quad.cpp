#include <glimac/SDLWindowManager.hpp>
#include <glimac/Program.hpp>
#include <glimac/FilePath.hpp>
#include <glimac/glm.hpp>
#include <GL/glew.h>
#include <iostream>
#include <cstddef>

using namespace glimac;

struct Vertex2DColor
{
    glm::vec2 position;
    glm::vec3 color;

    Vertex2DColor(){};
    Vertex2DColor(glm::vec2 pos, glm::vec3 col){
        position = pos;
        color = col;
    };
};



int main(int argc, char** argv) {
    // Initialize SDL and open a window
    SDLWindowManager windowManager(800, 600, "GLImac");

    // Initialize glew for OpenGL3+ support
    GLenum glewInitError = glewInit();
    if(GLEW_OK != glewInitError) {
        std::cerr << glewGetErrorString(glewInitError) << std::endl;
        return EXIT_FAILURE;
    }

    std::cout << "OpenGL Version : " << glGetString(GL_VERSION) << std::endl;
    std::cout << "GLEW Version : " << glewGetString(GLEW_VERSION) << std::endl;

    FilePath applicationPath(argv[0]);
    Program program = loadProgram(applicationPath.dirPath() + "shaders/triangle.vs.glsl", applicationPath.dirPath() + "shaders/triangle.fs.glsl");
    program.use();

    /*********************************
     * HERE SHOULD COME THE INITIALIZATION CODE
     *********************************/

    //Création d'un vbo
    GLuint vbo;
    glGenBuffers(1, &vbo);

    //Binding du vbo
    glBindBuffer(GL_ARRAY_BUFFER, vbo);

    //Création des vertex/remplissage du vbo
    Vertex2DColor vertices[]= {
        Vertex2DColor(glm::vec2(-0.5,-0.5), glm::vec3(1,0,0)),
        Vertex2DColor(glm::vec2(-0.5,0.5), glm::vec3(0,1,0)),
        Vertex2DColor(glm::vec2(0.5,-0.5), glm::vec3(1,1,0)),
        Vertex2DColor(glm::vec2(-0.5,0.5), glm::vec3(0,1,0)),
        Vertex2DColor(glm::vec2(0.5,0.5), glm::vec3(0,0,1)),
        Vertex2DColor(glm::vec2(0.5,-0.5), glm::vec3(1,1,0))
    };
    glBufferData(GL_ARRAY_BUFFER, 6*sizeof(Vertex2DColor), vertices, GL_STATIC_DRAW);

    //Débind du vbo
    glBindBuffer(GL_ARRAY_BUFFER, 0);

    //Création du vao
    GLuint vao;
    glGenVertexArrays(1, &vao);

    //Binding du vao
    glBindVertexArray(vao);

    //Activation des attributs de vertex
    const GLuint VERTEX_ATTR_POSITION = 3;
    glEnableVertexAttribArray(VERTEX_ATTR_POSITION);
    const GLuint VERTEX_ATTR_COLOR = 8;
    glEnableVertexAttribArray(VERTEX_ATTR_COLOR);

    //Spécification des attributs de vertex
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glVertexAttribPointer(VERTEX_ATTR_POSITION, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex2DColor), (const GLvoid*)(offsetof(Vertex2DColor, position)));
    glVertexAttribPointer(VERTEX_ATTR_COLOR, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex2DColor), (const GLvoid*)(offsetof(Vertex2DColor, color)));
    glBindBuffer(GL_ARRAY_BUFFER, 0);

    //Débind du vao
    glBindVertexArray(0);



    // Application loop:
    bool done = false;
    while(!done) {
        // Event loop:
        SDL_Event e;
        while(windowManager.pollEvent(e)) {
            if(e.type == SDL_QUIT) {
                done = true; // Leave the loop after this iteration
            }
        }

        /*********************************
         * HERE SHOULD COME THE RENDERING CODE
         *********************************/
        //Nettoyer la fenêtre
        glClear(GL_COLOR_BUFFER_BIT);

        //Dessiner en utilisatn le vao
        glBindVertexArray(vao);
        glDrawArrays(GL_TRIANGLES, 0, 6);
        glBindVertexArray(0);


        // Update the display
        windowManager.swapBuffers();
    }

    glDeleteBuffers(1, &vbo);
    glDeleteVertexArrays(1, &vao);

    return EXIT_SUCCESS;
}
