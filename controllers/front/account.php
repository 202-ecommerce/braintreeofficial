<?php
/**
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
 */

use BraintreeAddons\classes\BraintreeVaulting;
use BraintreeAddons\classes\BraintreeCustomer;
use BraintreeAddons\classes\AbstractMethodBraintree;
use BraintreeAddons\services\ServiceBraintreeVaulting;

class BraintreeAccountModuleFrontController extends ModuleFrontController
{
    /* @var ServiceBraintreeVaulting*/
    protected $serviceBraintreeVaulting;

    public function __construct()
    {
        $this->auth = true;
        parent::__construct();
        $this->context = Context::getContext();
        $this->serviceBraintreeVaulting = new ServiceBraintreeVaulting();
    }

    /**
     * @see FrontController::postProcess()
     */
    public function postProcess()
    {
        /* @var $method MethodBraintree*/
        if (Tools::getValue('process') == 'delete') {
            $id = (int)Tools::getValue('id_method');
            $payment_method = new BraintreeVaulting($id);
            $method = AbstractMethodBraintree::load('Braintree');
            $method->deleteVaultedMethod($payment_method);
            $payment_method->delete();
        }
        if (Tools::getValue('process') == 'save') {
            $all_values = Tools::getAllValues();
            foreach ($all_values as $key => $value) {
                $val_arr = explode('_', $key);
                if ($val_arr[0] == 'name') {
                    $payment_method = new BraintreeVaulting($val_arr[1]);
                    $payment_method->name = $value;
                    $payment_method->save();
                }
            }
        }
    }

    /**
     * @see FrontController::initContent()
     */
    public function initContent()
    {
        parent::initContent();
        $methods = $this->serviceBraintreeVaulting->getCustomerGroupedMethods($this->context->customer->id);
        $this->context->smarty->assign(array(
            'payment_methods' => $methods,
        ));
        $this->setTemplate('module:braintree/views/templates/front/payment_methods.tpl');
    }


    /**
     * Set my account breadcrumb links.
     */
    public function getBreadcrumbLinks()
    {
        $breadcrumb = parent::getBreadcrumbLinks();
        $breadcrumb['links'][] = $this->addMyAccountToBreadcrumb();

        return $breadcrumb;
    }

    /**
     * Adds page-customer-account body class.
     */
    public function getTemplateVarPage()
    {
        $page = parent::getTemplateVarPage();
        $page['body_classes']['page-customer-account'] = true;

        return $page;
    }
}
