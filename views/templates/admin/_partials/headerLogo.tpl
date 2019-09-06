{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2019 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="alert alert-info">
	<p>
        {l s='Note : As part of European Regulation PSD2 and related SCA (Strong Customer Authentication) planned on September 14th 2019, all transactions will have to go through SCA (3DS 2.0) with the aim to reduce friction (fewer “client challenges”) while raise conversion and protection (more liability shifts from merchant to bank).' mod='braintree'}
	</p>

	<p>
        {l s='It is thus recommended to enable 3D Secure in order to avoid bank declines and impact to your business. (Go to "Customize Experience Checkout")' mod='braintree'}
	</p>

	<p>
        {{l s='More info in our blog post [b]to get the last updates:[/b]' mod='braintree'}|braintreereplace}
		<a href="https://www.braintreepayments.com/ie/features/3d-secure">
			https://www.braintreepayments.com/ie/features/3d-secure
		</a>
	</p>
</div>

<div class="panel active-panel bt__flex bt__align-items-center">
	<div class="bt__pr-4">
		<img style="width: 135px" src="/modules/braintree/views/img/braintree-paypal.png">
	</div>
	<div class="bt__pl-5">
		<p>
			{l s='Activate the Braintree module to start converting better on mobile and all platforms in 45+ countries' mod='braintree'}.
		</p>
		{if $page_header_toolbar_title !== 'Help' && $page_header_toolbar_title !== 'Logs'}
			<p>{l s='Activate in three easy steps' mod='braintree'}: </p>
			<p>
				<ul class="list-unstyled">
					<li>
						<a href="#bt_config_account" data-bt-link-settings>1) {l s='Connect below your existing Braintree account or create a new one' mod='braintree'}.</a>
					</li>
					<li>
						<a href="#bt_config_behavior" data-bt-link-settings>2) {l s='Enable Credit Card and/or PayPal wallet as payment methods' mod='braintree'}.</a>
					</li>
					<li>
						<a href="#bt_config_payment" data-bt-link-settings>3) {l s='Adjust your Payment setting to either capture payments instantly (Sale), or after you confirm the order (Authorize)' mod='braintree'}.</a>
					</li>
					<li>
						<a href="#bt_config_environment" data-bt-link-settings>4) {l s='Make sure the module is set to Production mode' mod='braintree'}.</a>
					</li>
				</ul>
			</p>
			<p><a target="_blank" href="https://www.paypal.com/fr/webapps/mpp/hosted">{l s='More Information' mod='braintree'}</a></p>
		{/if}
	</div>
</div>