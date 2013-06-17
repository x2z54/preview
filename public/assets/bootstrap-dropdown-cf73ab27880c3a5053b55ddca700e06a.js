/* ============================================================
 * bootstrap-dropdown.js v2.3.1
 * http://twitter.github.com/bootstrap/javascript.html#dropdowns
 * ============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */
!function(e){"use strict";function t(){e(i).each(function(){n(e(this)).removeClass("open")})}function n(t){var n,i=t.attr("data-target");return i||(i=t.attr("href"),i=i&&/#/.test(i)&&i.replace(/.*(?=#[^\s]*$)/,"")),n=i&&e(i),n&&n.length||(n=t.parent()),n}var i="[data-toggle=dropdown]",r=function(t){var n=e(t).on("click.dropdown.data-api",this.toggle);e("html").on("click.dropdown.data-api",function(){n.parent().removeClass("open")})};r.prototype={constructor:r,toggle:function(){var i,r,o=e(this);if(!o.is(".disabled, :disabled"))return i=n(o),r=i.hasClass("open"),t(),r||i.toggleClass("open"),o.focus(),!1},keydown:function(t){var r,o,a,s,u;if(/(38|40|27)/.test(t.keyCode)&&(r=e(this),t.preventDefault(),t.stopPropagation(),!r.is(".disabled, :disabled"))){if(a=n(r),s=a.hasClass("open"),!s||s&&27==t.keyCode)return 27==t.which&&a.find(i).focus(),r.click();o=e("[role=menu] li:not(.divider):visible a",a),o.length&&(u=o.index(o.filter(":focus")),38==t.keyCode&&u>0&&u--,40==t.keyCode&&u<o.length-1&&u++,~u||(u=0),o.eq(u).focus())}}};var o=e.fn.dropdown;e.fn.dropdown=function(t){return this.each(function(){var n=e(this),i=n.data("dropdown");i||n.data("dropdown",i=new r(this)),"string"==typeof t&&i[t].call(n)})},e.fn.dropdown.Constructor=r,e.fn.dropdown.noConflict=function(){return e.fn.dropdown=o,this},e(document).on("click.dropdown.data-api",t).on("click.dropdown.data-api",".dropdown form",function(e){e.stopPropagation()}).on("click.dropdown-menu",function(e){e.stopPropagation()}).on("click.dropdown.data-api",i,r.prototype.toggle).on("keydown.dropdown.data-api",i+", [role=menu]",r.prototype.keydown)}(window.jQuery);