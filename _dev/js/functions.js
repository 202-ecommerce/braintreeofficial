/*
 * 2007-2021 PayPal
 *
 *  NOTICE OF LICENSE
 *
 *  This source file is subject to the Academic Free License (AFL 3.0)
 *  that is bundled with this package in the file LICENSE.txt.
 *  It is also available through the world-wide-web at this URL:
 *  http://opensource.org/licenses/afl-3.0.php
 *  If you did not receive a copy of the license and are unable to
 *  obtain it through the world-wide-web, please send an email
 *  to license@prestashop.com so we can send you a copy immediately.
 *
 *  DISCLAIMER
 *
 *  Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 *  versions in the future. If you wish to customize PrestaShop for your
 *  needs please refer to http://www.prestashop.com for more information.
 *
 *  @author 2007-2021 PayPal
 *  @author 202 ecommerce <tech@202-ecommerce.com>
 *  @copyright PayPal
 *  @license http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 */

//  Highlighting necessary block while click on link in header
export const hoverConfig = (el) => {

  // Remove highlighting from all blocks
  $('.defaultForm').removeClass('bt-settings-link-on');
  $('.page-head-tabs a').removeClass('bt-settings-link-on bt__border-b-primary');

  // Add highlighting for current block
  el.addClass('bt-settings-link-on');

  // Scroll to current block 
  $('html, body').animate({
    scrollTop: `${el.offset().top - 200}px`,
  }, 900);
};

//  Highlighting necessary tab while click on link in header
export const hoverTabConfig = () => {
  const tabs = document.querySelectorAll('.page-head-tabs a');
  const currentTab = $('.page-head-tabs a.current');

  tabs.forEach((el) => {
    const checkoutTab = $(el).attr('href').includes('AdminBraintreeOfficialCustomizeCheckout');
    const setupTab = $(el).attr('href').includes('AdminBraintreeOfficialSetup');

    // Add highlighting for current tab
    if ((currentTab.attr('href').includes('AdminBraintreeOfficialCustomizeCheckout') && setupTab)
      || (currentTab.attr('href').includes('AdminBraintreeOfficialSetup') && checkoutTab)) {
      $(el).addClass('bt-settings-link-on bt__border-b-primary');
    }
  });

  // Scroll to current tab 
  $('html, body').animate({
    scrollTop: `${$('.page-head-tabs').offset().top - 200}px`,
  }, 900);
};

// Show a block while choosing first option in current select, hide it while choosing others options   
export const selectOption = (select, el) => {
  if (select) {
    select.on('change', (e) => {
      const index = e.target.selectedIndex;

      if (index === 0) {
        el.show();
      } else {
        el.hide();
      }
    });
  }
};
