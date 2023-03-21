#include <glimac/SDLWindowManager.hpp>
#include <GL/glew.h>
#include <glimac/FilePath.hpp>
#include <glimac/Program.hpp>
#include <glimac/Image.hpp>
#include <glimac/glm.hpp>
#include <cstddef>
#include <iostream>

using namespace glimac;

struct Vertex2DUV {
    glm::vec2 position;
    glm::vec2 coord_texture;

    Vertex2DUV(){};
    Vertex2DUV(glm::vec2 pos, glm::vec2 uv){
        position = pos;
        coord_texture = uv;
    };
};

glm::mat3 translate(float tx, float ty) {
  return glm::mat3(glm::vec3(1, 0, 0), glm::vec3(0, 1, 0), glm::vec3(tx, ty, 1));
}

glm::mat3 scale(float sx, float sy) {
  return glm::mat3(glm::vec3(sx, 0, 0), glm::vec3(0, sy, 0), glm::vec3(0, 0, 1));
}

glm::mat3 rotate(float a) {
  return glm::mat3(glm::vec3(cos(glm::radians(a)), sin(glm::radians(a)), 0), 
              glm::vec3(-sin(glm::radians(a)), cos(glm::radians(a)), 0), 
              glm::vec3(0, 0, 1));
}

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

    std::unique_ptr<Image> my_texture = loadImage("../assets/textures/triforce.png");
    if (my_texture!=NULL){
        std::cout << "bien chargé :)" << std::endl;
    }

    FilePath applicationPath(argv[0]);
    Program program = loadProgram(applicationPath.dirPath() +  "shaders/" + argv[1], applicationPath.dirPath() +  "shaders/" + argv[2]);
    program.use();

    //GLint uTimeId = glGetUniformLocation(program.getGLId(), "uTime");
    GLint uModelMatrixId = glGetUniformLocation(program.getGLId(), "uModelMatrix");
    GLint uTextureId = glGetUniformLocation(program.getGLId(), "uTexture");
    

    /*********************************
     * HERE SHOULD COME THE INITIALIZATION CODE
     *********************************/

    //Ajout de textures
    GLuint textures;
    glGenTextures(1,&textures);
    glBindTexture(GL_TEXTURE_2D, textures);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, my_texture->getWidth(), my_texture->getHeight(), 0, GL_RGBA, GL_FLOAT, my_texture->getPixels());
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glBindTexture(GL_TEXTURE_2D, 0);

    GLuint vbo;
    glGenBuffers(1, &vbo);

    glBindBuffer(GL_ARRAY_BUFFER, vbo);

    Vertex2DUV vertices[] = {
        Vertex2DUV(glm::vec2(-1,-1), glm::vec2(0,1)),
        Vertex2DUV(glm::vec2(1,-1), glm::vec2(1,1)),
        Vertex2DUV(glm::vec2(0,1), glm::vec2(0.5,0))
    };
    glBufferData(GL_ARRAY_BUFFER, 3*sizeof(Vertex2DUV), vertices, GL_STATIC_DRAW);

    glBindBuffer(GL_ARRAY_BUFFER,0);

    GLuint vao;
    glGenVertexArrays(1, &vao);

    glBindVertexArray(vao);

    const GLuint VERTEX_ATTR_POSITION =0;
    glEnableVertexAttribArray(VERTEX_ATTR_POSITION);
    const GLuint VERTEX_ATTR_UV=1;
    glEnableVertexAttribArray(VERTEX_ATTR_UV);

    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glVertexAttribPointer(VERTEX_ATTR_POSITION, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex2DUV), (const GLvoid*)(offsetof(Vertex2DUV, position)));
    glVertexAttribPointer(VERTEX_ATTR_UV, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex2DUV), (const GLvoid*)(offsetof(Vertex2DUV, coord_texture)));

    glBindVertexArray(0);

    int c=0;
    glm::mat3 my_matrix;

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

        c++;

        //Dessiner en utilisatn le vao
        glBindVertexArray(vao);
        my_matrix=translate(0.5,0.5);
        my_matrix*=scale(0.25,0.25);
        my_matrix*=rotate(c);
        glUniformMatrix3fv(uModelMatrixId, 1, GL_FALSE,glm::value_ptr(my_matrix));
        glUniform1i(uTextureId, 0);
        glBindTexture(GL_TEXTURE_2D, uTextureId);
        glDrawArrays(GL_TRIANGLES, 0, 3);
        glBindTexture(GL_TEXTURE_2D, 0);

        my_matrix=translate(-0.5,0.5);
        my_matrix*=scale(0.25,0.25);
        my_matrix*=rotate(c);
        glUniformMatrix3fv(uModelMatrixId, 1, GL_FALSE,glm::value_ptr(my_matrix));
        glBindTexture(GL_TEXTURE_2D, uTextureId);
        glDrawArrays(GL_TRIANGLES, 0, 3);
        glBindTexture(GL_TEXTURE_2D, 0);

        my_matrix=translate(-0.5,-0.5);
        my_matrix*=scale(0.25,0.25);
        my_matrix*=rotate(c);
        glUniformMatrix3fv(uModelMatrixId, 1, GL_FALSE,glm::value_ptr(my_matrix));
        glBindTexture(GL_TEXTURE_2D, uTextureId);
        glDrawArrays(GL_TRIANGLES, 0, 3);
        glBindTexture(GL_TEXTURE_2D, 0);

        my_matrix=translate(0.5,-0.5);
        my_matrix*=scale(0.25,0.25);
        my_matrix*=rotate(c);
        glUniformMatrix3fv(uModelMatrixId, 1, GL_FALSE,glm::value_ptr(my_matrix));
        glDrawArrays(GL_TRIANGLES, 0, 3);
        glBindTexture(GL_TEXTURE_2D, uTextureId);
        glDrawArrays(GL_TRIANGLES, 0, 3);
        glBindTexture(GL_TEXTURE_2D, 0);


        // Update the display
        windowManager.swapBuffers();
    }
    glDeleteTextures(1, &textures);
    glDeleteBuffers(1, &vbo);
    glDeleteVertexArrays(1, &vao);

    return EXIT_SUCCESS;
}
