set debuginfod enabled on
set startup-quietly on
set auto-load safe-path .
set auto-load local-gdbinit on
set logging enabled on
set disable-randomization on
set print inferior-events on
set debug skip on

# defaults to 200
set print elements 10

# set this in local project's .gdbinit
# set logging file gdb.log

define pll
  set var $n = $arg0
  while $n
    print $n
    set var $n = $n->next
  end
  set var $n = $arg0
  while $n
    print *($n)
    set var $n = $n->next
  end
end

document pll
  pll LIST_HEAD_POINTER
  Print all the fields of the nodes in the linked list pointed to by LIST_HEAD_POINTER. Assumes there is a next field in the struct.
end

define p_dyn_arr
  set var $i = 0
  set var $size = $arg0
  while ($i < $size)
    print $arg1[$i]
    set $i = $i + 1
  end
end

document p_dyn_arr
  p_dyn_arr ARRAY_SIZE DYNAMIC_ARRAY
  Prints each item in the dynamic array. 
end


define indentby
  printf "\n"
  set $i_$arg0 = $arg0
  while $i_$arg0 > 10
    set $i_$arg0 = $i_$arg0 - 1
    printf "%c", ' '
  end
end

define draw_sideways_btree
  set $node_$arg0 = ($arg1)
  set $leftid_$arg0 = $arg0 + 1
  set $rightid_$arg0 = $arg0 + 2
  set $space_$arg0 = ($arg2) + 10
  
  if $node_$arg0->right
    draw_sideways_btree $rightid_$arg0 $node_$arg0->right $space_$arg0
  end
  
  indentby $space_$arg0

  printf "%d\n", $node_$arg0->item

  if $node_$arg0->left
    draw_sideways_btree $leftid_$arg0 $node_$arg0->left $space_$arg0
  end    
end

define start_draw_sideways_btree
  draw_sideways_btree 0 $arg0 0
end

document start_draw_sideways_btree
  start_draw_sideways_btree ROOT_POINTER_NAME
  Draw a sideways representation of the binary tree pointed to by ROOT_POINTER_NAME 
end
