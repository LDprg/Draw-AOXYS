#include <SFML/Graphics.hpp>

int main()
{
    sf::ContextSettings cs = sf::ContextSettings();
    cs.antialiasingLevel = 16;
    sf::RenderWindow window(sf::VideoMode(500, 500), "SFML works1!", sf::Style::Default, cs);

    sf::CircleShape shape(200.f,200);
    shape.setFillColor(sf::Color::Green);

    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear();
        window.draw(shape);
        window.display();
    }

    return 0;
}