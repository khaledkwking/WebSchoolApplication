﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageMain.master" AutoEventWireup="true" Inherits="Admin_ModalBootPage" Codebehind="ModalBootPage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


 <div class="container">
	<div class="row">
        <h2>"Waiting for..." modal dialog with progress bar</h2>
        <p>If you need to block a user screen while loading some data or doing heavy computations, 
        you can use this snippet to show modal dialog with progress bar.</p>
		<p>Fork it on <a href="https://github.com/ehpc/bootstrap-waitingfor">github</a></p>
        <h2>Examples <small>All dialogs will be automatically closed after 2 seconds</small></h2>
        
        <h3>Simple dialog</h3>
        <pre>
waitingDialog.show();</pre>
        <button type="button" class="btn btn-primary" onclick="waitingDialog.show();setTimeout(function () {waitingDialog.hide();}, 3000);">Show dialog</button>
        
        <h3>Dialog with custom message</h3>
        <pre>
waitingDialog.show('Custom message');</pre>
        <button type="button" class="btn btn-success" onclick="waitingDialog.show('Custom message');setTimeout(function () {waitingDialog.hide();}, 2000);">Show dialog</button>
        
        <h3>Dialog with custom settings</h3>
        <pre>
waitingDialog.show('Custom message', {dialogSize: 'sm', progressType: 'warning'});</pre>
        <button type="button" class="btn btn-warning" onclick="waitingDialog.show('Custom message', {dialogSize: 'sm', progressType: 'warning'});setTimeout(function () {waitingDialog.hide();}, 2000);">Show dialog</button>
        
        <h3>Dialog with some callback firing after it was hidden</h3>
        <pre>waitingDialog.show('Dialog with callback on hidden',{onHide: function () {alert('Callback!');}});</pre>
        
        <p> </p>
	</div>
</div>

        <script>
            /**
 * Module for displaying "Waiting for..." dialog using Bootstrap
 *
 * @author Eugene Maslovich <ehpc@em42.ru>
 */

            var waitingDialog = waitingDialog || (function ($) {
                'use strict';

                // Creating modal dialog's DOM
                var $dialog = $(
                    '<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
                    '<div class="modal-dialog modal-m">' +
                    '<div class="modal-content">' +
                        '<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
                        '<div class="modal-body">' +
                            '<div class="progress progress-striped active" style="margin-bottom:0;"><div class="progress-bar" style="width: 100%"></div></div>' +
                        '</div>' +
                    '</div></div></div>');

                return {
                    /**
                     * Opens our dialog
                     * @param message Custom message
                     * @param options Custom options:
                     * 				  options.dialogSize - bootstrap postfix for dialog size, e.g. "sm", "m";
                     * 				  options.progressType - bootstrap postfix for progress bar type, e.g. "success", "warning".
                     */
                    show: function (message, options) {
                        // Assigning defaults
                        if (typeof options === 'undefined') {
                            options = {};
                        }
                        if (typeof message === 'undefined') {
                            message = 'Loading';
                        }
                        var settings = $.extend({
                            dialogSize: 'm',
                            progressType: '',
                            onHide: null // This callback runs after the dialog was hidden
                        }, options);

                        // Configuring dialog
                        $dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
                        $dialog.find('.progress-bar').attr('class', 'progress-bar');
                        if (settings.progressType) {
                            $dialog.find('.progress-bar').addClass('progress-bar-' + settings.progressType);
                        }
                        $dialog.find('h3').text(message);
                        // Adding callbacks
                        if (typeof settings.onHide === 'function') {
                            $dialog.off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
                                settings.onHide.call($dialog);
                            });
                        }
                        // Opening dialog
                        $dialog.modal();
                    },
                    /**
                     * Closes dialog
                     */
                    hide: function () {
                        $dialog.modal('hide');
                    }
                };

            })(jQuery);

            </script>
</asp:Content>

