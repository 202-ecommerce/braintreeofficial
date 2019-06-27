/**
 * 2007-2019 PrestaShop
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA
 * @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
 * International Registered Trademark & Property of PrestaShop SA
 */

import * as functions from './functions.js'; 

var SetupAdmin = {
  init() {
    $('[data-confirm-credentials]').click(() => {
      $('#bt_config_account').submit();
    });

    $('[data-bt-logout]').click((e) => {
      SetupAdmin.logoutAccount(e.target);
    });

    $(document).on('click', '#btn-check-requirements', () => {
      SetupAdmin.checkRequirements();
    });

    $('[data-bt-link-settings]').on('click', (e) => {
      let el = $(e.target.attributes.href.value);
      if (el.length) {
        functions.hoverConfig(el);
      } else {
        functions.hoverTabConfig();
      }
    });

    $('.defaultForm').on('mouseleave', (e) => {
      $(e.currentTarget).removeClass('bt-settings-link-on');
    });
  },

  logoutAccount(element) {
    const form = $(element).closest('form');
    form.find('div.current-account input').val('');
    form.submit();
  },

  checkRequirements() {
    $.ajax({
      url: controllerUrl,
      type: 'POST',
      data: {
        ajax: true,
        action: 'CheckCredentials',
      },
      success(response) {
        $('#status-block').html(response);
      },
    });
  },
};

$(document).ready(() => SetupAdmin.init());