goog.provide('dommy.core');
goog.require('cljs.core');
goog.require('clojure.string');
/**
* append child to parent, both DOM nodes. return parent
*/
dommy.core.append_BANG_ = (function append_BANG_(parent,child){
parent.appendChild(child);
return parent;
});
/**
* prepend child to parent, both DOM nodes. return parent
*/
dommy.core.prepend_BANG_ = (function prepend_BANG_(parent,child){
parent.insertBefore(child,parent.firstChild);
return parent;
});
/**
* remove node from parent, return parent
*/
dommy.core.remove_BANG_ = (function remove_BANG_(node){
var parent = node.parentNode;
parent.removeChild(node);
return parent;
});
/**
* replace node with new, return new
*/
dommy.core.replace_BANG_ = (function replace_BANG_(node,new$){
node.parentNode.replaceChild(new$,node);
return new$;
});
/**
* does class-name string have class starting at index idx.
* only will be used when node.classList doesn't exist
*/
dommy.core.class_match_QMARK_ = (function class_match_QMARK_(class_name,class$,idx){
var and__3822__auto__ = (function (){var or__3824__auto__ = (idx === 0);
if(or__3824__auto__)
{return or__3824__auto__;
} else
{return (" " === class_name.charAt((idx - 1)));
}
})();
if(cljs.core.truth_(and__3822__auto__))
{var total_len = class_name.length;
var stop = (idx + class$.length);
if((stop <= total_len))
{var or__3824__auto__ = (stop === total_len);
if(or__3824__auto__)
{return or__3824__auto__;
} else
{return (" " === class_name.charAt(stop));
}
} else
{return null;
}
} else
{return and__3822__auto__;
}
});
/**
* Finds the index of class in a space-delimited class-name
* only will be used when node.classList doesn't exist
*/
dommy.core.class_index = (function class_index(class_name,class$){
var start_from = 0;
while(true){
var i = class_name.indexOf(class$,start_from);
if((i >= 0))
{if(cljs.core.truth_(dommy.core.class_match_QMARK_.call(null,class_name,class$,i)))
{return i;
} else
{{
var G__3853 = (i + class$.length);
start_from = G__3853;
continue;
}
}
} else
{return null;
}
break;
}
});
/**
* Does DOM node have class. Uses node.classList if available
* and otherwise does fast parse of className string
*/
dommy.core.has_class_QMARK_ = (function has_class_QMARK_(node,class$){
var temp__3971__auto__ = node.classList;
if(cljs.core.truth_(temp__3971__auto__))
{var class_list = temp__3971__auto__;
return class_list.contains(class$);
} else
{var temp__3974__auto__ = dommy.core.class_index.call(null,node.className,class$);
if(cljs.core.truth_(temp__3974__auto__))
{var i = temp__3974__auto__;
return (i >= 0);
} else
{return null;
}
}
});
/**
* add class to node
*/
dommy.core.add_class_BANG_ = (function add_class_BANG_(node,class$){
var temp__3971__auto__ = node.classList;
if(cljs.core.truth_(temp__3971__auto__))
{var class_list = temp__3971__auto__;
return class_list.add(class$);
} else
{var class_name = node.className;
if(cljs.core.truth_(dommy.core.class_index.call(null,class_name,class$)))
{return null;
} else
{return node.className = (((class_name === ""))?class$:[cljs.core.str(class_name),cljs.core.str(" "),cljs.core.str(class$)].join(''));
}
}
});
dommy.core.remove_class_str = (function remove_class_str(init_class_name,class$){
var class_name = init_class_name;
while(true){
var class_len = class_name.length;
var temp__3971__auto__ = dommy.core.class_index.call(null,class_name,class$);
if(cljs.core.truth_(temp__3971__auto__))
{var i = temp__3971__auto__;
{
var G__3854 = (function (){var end = (i + class$.length);
return [cljs.core.str((((end < class_len))?[cljs.core.str(class_name.substring(0,i)),cljs.core.str(class_name.substr((end + 1)))].join(''):class_name.substring(0,(i - 1))))].join('');
})();
class_name = G__3854;
continue;
}
} else
{return class_name;
}
break;
}
});
/**
* remove class from node
*/
dommy.core.remove_class_BANG_ = (function remove_class_BANG_(node,class$){
var temp__3971__auto__ = node.classList;
if(cljs.core.truth_(temp__3971__auto__))
{var class_list = temp__3971__auto__;
return class_list.remove(class$);
} else
{var class_name = node.className;
var new_class_name = dommy.core.remove_class_str.call(null,class_name,cljs.core.name.call(null,class$));
if((class_name === new_class_name))
{return null;
} else
{return node.className = new_class_name;
}
}
});
/**
* (toggle-class! node class) will add-class! if node does not have class and remove-class! otherwise.
* (toggle-class! node class add?) will add-class! if add? is truthy, otherwise it will remove-class!
*/
dommy.core.toggle_class_BANG_ = (function() {
var toggle_class_BANG_ = null;
var toggle_class_BANG___2 = (function (node,class$){
var temp__3971__auto__ = node.classList;
if(cljs.core.truth_(temp__3971__auto__))
{var class_list = temp__3971__auto__;
return class_list.toggle(class$);
} else
{return toggle_class_BANG_.call(null,node,class$,cljs.core.not.call(null,dommy.core.has_class_QMARK_.call(null,node,class$)));
}
});
var toggle_class_BANG___3 = (function (node,class$,add_QMARK_){
if(cljs.core.truth_(add_QMARK_))
{return dommy.core.add_class_BANG_.call(null,node,class$);
} else
{return dommy.core.remove_class_BANG_.call(null,node,class$);
}
});
toggle_class_BANG_ = function(node,class$,add_QMARK_){
switch(arguments.length){
case 2:
return toggle_class_BANG___2.call(this,node,class$);
case 3:
return toggle_class_BANG___3.call(this,node,class$,add_QMARK_);
}
throw(new Error('Invalid arity: ' + arguments.length));
};
toggle_class_BANG_.cljs$lang$arity$2 = toggle_class_BANG___2;
toggle_class_BANG_.cljs$lang$arity$3 = toggle_class_BANG___3;
return toggle_class_BANG_;
})()
;
dommy.core.selector = (function selector(data){
if(cljs.core.coll_QMARK_.call(null,data))
{return clojure.string.join.call(null," ",cljs.core.map.call(null,selector,data));
} else
{if((function (){var or__3824__auto__ = cljs.core.string_QMARK_.call(null,data);
if(or__3824__auto__)
{return or__3824__auto__;
} else
{return cljs.core.keyword_QMARK_.call(null,data);
}
})())
{return cljs.core.name.call(null,data);
} else
{return null;
}
}
});
/**
* fires f if event.target is found within the specified selector
*/
dommy.core.live_listener = (function live_listener(node,selector,f){
return (function (event){
if((Array.prototype.slice.call(node.querySelectorAll(dommy.core.selector.call(null,selector))).indexOf(event.target) >= 0))
{return f.call(null,event);
} else
{return null;
}
});
});
dommy.core.listen_BANG_ = (function() {
var listen_BANG_ = null;
var listen_BANG___3 = (function (node,event_type,f){
if(cljs.core.truth_(node.addEventListener))
{return node.addEventListener(cljs.core.name.call(null,event_type),f);
} else
{return node.attachEvent(cljs.core.name.call(null,event_type),f);
}
});
var listen_BANG___4 = (function (node,event_type,live_selector,f){
return listen_BANG_.call(null,node,event_type,dommy.core.live_listener.call(null,node,live_selector,f));
});
listen_BANG_ = function(node,event_type,live_selector,f){
switch(arguments.length){
case 3:
return listen_BANG___3.call(this,node,event_type,live_selector);
case 4:
return listen_BANG___4.call(this,node,event_type,live_selector,f);
}
throw(new Error('Invalid arity: ' + arguments.length));
};
listen_BANG_.cljs$lang$arity$3 = listen_BANG___3;
listen_BANG_.cljs$lang$arity$4 = listen_BANG___4;
return listen_BANG_;
})()
;
