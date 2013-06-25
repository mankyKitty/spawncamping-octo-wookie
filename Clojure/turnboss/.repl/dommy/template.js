goog.provide('dommy.template');
goog.require('cljs.core');
goog.require('dommy.core');
goog.require('clojure.string');
dommy.template.PElement = {};
dommy.template._elem = (function _elem(this$){
if((function (){var and__3822__auto__ = this$;
if(and__3822__auto__)
{return this$.dommy$template$PElement$_elem$arity$1;
} else
{return and__3822__auto__;
}
})())
{return this$.dommy$template$PElement$_elem$arity$1(this$);
} else
{var x__2285__auto__ = (((this$ == null))?null:this$);
return (function (){var or__3824__auto__ = (dommy.template._elem[goog.typeOf(x__2285__auto__)]);
if(or__3824__auto__)
{return or__3824__auto__;
} else
{var or__3824__auto____$1 = (dommy.template._elem["_"]);
if(or__3824__auto____$1)
{return or__3824__auto____$1;
} else
{throw cljs.core.missing_protocol.call(null,"PElement.-elem",this$);
}
}
})().call(null,this$);
}
});
dommy.template.style_str = (function style_str(m){
return clojure.string.join.call(null," ",cljs.core.map.call(null,(function (p__3819){
var vec__3820 = p__3819;
var k = cljs.core.nth.call(null,vec__3820,0,null);
var v = cljs.core.nth.call(null,vec__3820,1,null);
return [cljs.core.str(cljs.core.name.call(null,k)),cljs.core.str(":"),cljs.core.str(cljs.core.name.call(null,v)),cljs.core.str(";")].join('');
}),m));
});
/**
* can have a seq for :classes key or a map for :style
*/
dommy.template.add_attr_BANG_ = (function add_attr_BANG_(node,k,v){
if(cljs.core.truth_(v))
{var G__3823 = k;
if(cljs.core._EQ_.call(null,"\uFDD0'style",G__3823))
{return node.setAttribute(cljs.core.name.call(null,k),dommy.template.style_str.call(null,v));
} else
{if(cljs.core._EQ_.call(null,"\uFDD0'classes",G__3823))
{var G__3824 = cljs.core.seq.call(null,v);
while(true){
if(G__3824)
{var c = cljs.core.first.call(null,G__3824);
dommy.core.add_class_BANG_.call(null,node,c);
{
var G__3825 = cljs.core.next.call(null,G__3824);
G__3824 = G__3825;
continue;
}
} else
{return null;
}
break;
}
} else
{if(cljs.core._EQ_.call(null,"\uFDD0'class",G__3823))
{return dommy.core.add_class_BANG_.call(null,node,v);
} else
{if("\uFDD0'else")
{return node.setAttribute(cljs.core.name.call(null,k),v);
} else
{return null;
}
}
}
}
} else
{return null;
}
});
dommy.template.next_css_index = (function next_css_index(s,start_idx){
var id_idx = s.indexOf("#",start_idx);
var class_idx = s.indexOf(".",start_idx);
var idx = Math.min(id_idx,class_idx);
if((idx < 0))
{return Math.max(id_idx,class_idx);
} else
{return idx;
}
});
/**
* dom element from css-style keyword like :a.class1 or :span#my-span.class
*/
dommy.template.base_element = (function base_element(node_key){
var node_str = cljs.core.name.call(null,node_key);
var base_idx = dommy.template.next_css_index.call(null,node_str,0);
var tag = (((base_idx > 0))?node_str.substring(0,base_idx):(((base_idx === 0))?"div":(("\uFDD0'else")?node_str:null)));
var node = document.createElement(tag);
if((base_idx >= 0))
{var str_3828 = node_str.substring(base_idx);
while(true){
var next_idx_3829 = dommy.template.next_css_index.call(null,str_3828,1);
var frag_3830 = (((next_idx_3829 >= 0))?str_3828.substring(0,next_idx_3829):str_3828);
var G__3827_3831 = frag_3830.charAt(0);
if(cljs.core._EQ_.call(null,"#",G__3827_3831))
{node.setAttribute("id",frag_3830.substring(1));
} else
{if(cljs.core._EQ_.call(null,".",G__3827_3831))
{dommy.core.add_class_BANG_.call(null,node,frag_3830.substring(1));
} else
{if("\uFDD0'else")
{throw (new Error([cljs.core.str("No matching clause: "),cljs.core.str(frag_3830.charAt(0))].join('')));
} else
{}
}
}
if((next_idx_3829 >= 0))
{{
var G__3832 = str_3828.substring(next_idx_3829);
str_3828 = G__3832;
continue;
}
} else
{}
break;
}
} else
{}
return node;
});
dommy.template.throw_unable_to_make_node = (function throw_unable_to_make_node(node_data){
throw [cljs.core.str("Don't know how to make node from: "),cljs.core.str(cljs.core.pr_str.call(null,node_data))].join('');
});
/**
* take data and return a document fragment
*/
dommy.template.__GT_document_fragment = (function() {
var __GT_document_fragment = null;
var __GT_document_fragment__1 = (function (data){
return __GT_document_fragment.call(null,document.createDocumentFragment(),data);
});
var __GT_document_fragment__2 = (function (result_frag,data){
if((function (){var G__3835 = data;
if(G__3835)
{if(cljs.core.truth_((function (){var or__3824__auto__ = null;
if(cljs.core.truth_(or__3824__auto__))
{return or__3824__auto__;
} else
{return G__3835.dommy$template$PElement$;
}
})()))
{return true;
} else
{if((!G__3835.cljs$lang$protocol_mask$partition$))
{return cljs.core.type_satisfies_.call(null,dommy.template.PElement,G__3835);
} else
{return false;
}
}
} else
{return cljs.core.type_satisfies_.call(null,dommy.template.PElement,G__3835);
}
})())
{result_frag.appendChild(dommy.template._elem.call(null,data));
return result_frag;
} else
{if(cljs.core.seq_QMARK_.call(null,data))
{var G__3836_3837 = cljs.core.seq.call(null,data);
while(true){
if(G__3836_3837)
{var child_3838 = cljs.core.first.call(null,G__3836_3837);
__GT_document_fragment.call(null,result_frag,child_3838);
{
var G__3839 = cljs.core.next.call(null,G__3836_3837);
G__3836_3837 = G__3839;
continue;
}
} else
{}
break;
}
return result_frag;
} else
{if("\uFDD0'else")
{return dommy.template.throw_unable_to_make_node.call(null,data);
} else
{return null;
}
}
}
});
__GT_document_fragment = function(result_frag,data){
switch(arguments.length){
case 1:
return __GT_document_fragment__1.call(this,result_frag);
case 2:
return __GT_document_fragment__2.call(this,result_frag,data);
}
throw(new Error('Invalid arity: ' + arguments.length));
};
__GT_document_fragment.cljs$lang$arity$1 = __GT_document_fragment__1;
__GT_document_fragment.cljs$lang$arity$2 = __GT_document_fragment__2;
return __GT_document_fragment;
})()
;
/**
* take data and return DOM node if it satisfies PElement and tries to
* make a document fragment otherwise
*/
dommy.template.__GT_node_like = (function __GT_node_like(data){
if((function (){var G__3841 = data;
if(G__3841)
{if(cljs.core.truth_((function (){var or__3824__auto__ = null;
if(cljs.core.truth_(or__3824__auto__))
{return or__3824__auto__;
} else
{return G__3841.dommy$template$PElement$;
}
})()))
{return true;
} else
{if((!G__3841.cljs$lang$protocol_mask$partition$))
{return cljs.core.type_satisfies_.call(null,dommy.template.PElement,G__3841);
} else
{return false;
}
}
} else
{return cljs.core.type_satisfies_.call(null,dommy.template.PElement,G__3841);
}
})())
{return dommy.template._elem.call(null,data);
} else
{return dommy.template.__GT_document_fragment.call(null,data);
}
});
/**
* element with either attrs or nested children [:div [:span "Hello"]]
*/
dommy.template.compound_element = (function compound_element(data){
var n = dommy.template.base_element.call(null,cljs.core.first.call(null,data));
var attrs = ((cljs.core.map_QMARK_.call(null,cljs.core.second.call(null,data)))?cljs.core.second.call(null,data):null);
var children = cljs.core.drop.call(null,(cljs.core.truth_(attrs)?2:1),data);
var G__3844_3846 = cljs.core.seq.call(null,attrs);
while(true){
if(G__3844_3846)
{var vec__3845_3847 = cljs.core.first.call(null,G__3844_3846);
var k_3848 = cljs.core.nth.call(null,vec__3845_3847,0,null);
var v_3849 = cljs.core.nth.call(null,vec__3845_3847,1,null);
dommy.template.add_attr_BANG_.call(null,n,k_3848,v_3849);
{
var G__3850 = cljs.core.next.call(null,G__3844_3846);
G__3844_3846 = G__3850;
continue;
}
} else
{}
break;
}
n.appendChild(dommy.template.__GT_node_like.call(null,children));
return n;
});
String.prototype.dommy$template$PElement$ = true;
String.prototype.dommy$template$PElement$_elem$arity$1 = (function (this$){
if(cljs.core.keyword_QMARK_.call(null,this$))
{return dommy.template.base_element.call(null,this$);
} else
{return document.createTextNode([cljs.core.str(this$)].join(''));
}
});
(dommy.template.PElement["number"] = true);
(dommy.template._elem["number"] = (function (this$){
return document.createTextNode([cljs.core.str(this$)].join(''));
}));
Text.prototype.dommy$template$PElement$ = true;
Text.prototype.dommy$template$PElement$_elem$arity$1 = (function (this$){
return this$;
});
cljs.core.PersistentVector.prototype.dommy$template$PElement$ = true;
cljs.core.PersistentVector.prototype.dommy$template$PElement$_elem$arity$1 = (function (this$){
return dommy.template.compound_element.call(null,this$);
});
HTMLElement.prototype.dommy$template$PElement$ = true;
HTMLElement.prototype.dommy$template$PElement$_elem$arity$1 = (function (this$){
return this$;
});
dommy.template.node = (function node(data){
if((function (){var G__3852 = data;
if(G__3852)
{if(cljs.core.truth_((function (){var or__3824__auto__ = null;
if(cljs.core.truth_(or__3824__auto__))
{return or__3824__auto__;
} else
{return G__3852.dommy$template$PElement$;
}
})()))
{return true;
} else
{if((!G__3852.cljs$lang$protocol_mask$partition$))
{return cljs.core.type_satisfies_.call(null,dommy.template.PElement,G__3852);
} else
{return false;
}
}
} else
{return cljs.core.type_satisfies_.call(null,dommy.template.PElement,G__3852);
}
})())
{return dommy.template._elem.call(null,data);
} else
{return dommy.template.throw_unable_to_make_node.call(null,data);
}
});
dommy.template.html__GT_nodes = (function html__GT_nodes(html){
var parent = document.createElement("div");
parent.insertAdjacentHTML("beforeend",html);
return Array.prototype.slice.call(parent.childNodes);
});
