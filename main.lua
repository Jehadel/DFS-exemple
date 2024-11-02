Object = require 'classic'

Stack = require 'stack'

Node = Object:extend()

function Node:new(name)
    self.name = name
    self.lst_neighbours = {}
    self.visited = false
end

function depth_first_search(start)
    local stack = Stack()

    -- push the first node in stack (wil be the last taken out)
    stack:push(start)

    -- keep iterating (looking up for neighbours) 
    while stack.empty == false do
        -- remove last/most recent item in stack, we will consider its neighbours
        current_node = stack:pop()
        -- set the node to visited
        current_node.visited = true
        print(current_node.name)

        -- iterate through its adjacent nodes (neighbours)
        for idx, neighbour in ipairs(current_node.lst_neighbours) do
            -- if the adjacent nodes have not been visited yet, then push them in stack
            if neighbour.visited == false then
                -- we set the node to visited
                neighbour.visited = true
                -- push them into stack
                stack:push(neighbour)
            end
        end
    end
end


-- TEST 
-- Create nodes with names
nodeA = Node('A')
nodeB = Node('B')
nodeC = Node('C')
nodeD = Node('D')
nodeE = Node('E')
nodeF = Node('F')
nodeG = Node('G')

table.insert(nodeA.lst_neighbours, nodeB)
table.insert(nodeA.lst_neighbours, nodeC)
table.insert(nodeA.lst_neighbours, nodeD)
table.insert(nodeB.lst_neighbours, nodeE)
table.insert(nodeE.lst_neighbours, nodeG)
table.insert(nodeC.lst_neighbours, nodeF)


depth_first_search(nodeA)