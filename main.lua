ball={t,x,y,r}
ball.t = "line"
width = love.graphics.getWidth()
height = love.graphics.getHeight()
ball.x = width/2
ball.y = height/2
ball.r = 10
n = 12
speed = 250
period = 0
x = {}
y = {}
r = {}
R = 10
i=0
a=1

function newCircle(n)
    x[n] = ball.x
    y[n] = ball.y
    r[n] = ball.r+5
end

function love.update(dt)
    period = period + 100*dt 
    if period >= 20 then
        period = 0
        if i < n then
        i = i + 1
        newCircle(i)
        else
            for a = 1, n do
                if r[a] > height and r[a] > width then
                    newCircle(a)
                end
            end
        end
    end
    if love.keyboard.isDown("left") then
        ball.x = ball.x -speed*dt
    elseif love.keyboard.isDown("right") then
        ball.x = ball.x +speed*dt
    end
    if love.keyboard.isDown("up") then
        ball.y = ball.y -speed*dt
    elseif love.keyboard.isDown("down") then
        ball.y = ball.y +speed*dt
    end
    R = 344*dt
end

function love.draw()
    love.graphics.setColor( 1, 1, 1, 1 )
    love.graphics.circle(ball.t,ball.x,ball.y,ball.r)
    love.graphics.setColor( 1, 1, 1, 0.5 )
    if i > 0 then
        for a = 1,i do
            r[a] = r[a] + R
            love.graphics.circle("line",x[a],y[a],r[a])
        end
    end
end