<?php

class ReporteController extends Zend_Controller_Action
{

    public function init()
    {
		$this->initView();
         
         //$auth = Zend_Auth::getInstance();
         if(!Zend_Auth::getInstance()->hasIdentity()) $this->_helper->redirector('index','auth');           

         $this->view->baseUrl = $this->_request->getBaseUrl();
         
         $this->view->DatosUser = Zend_Auth::getInstance()->getIdentity();  
    }

    public function indexAction()
    {
	
		$data = array();
		
		$data[0] = array("uno","dos","tres");
		$data[1] = array("xxx","yyy","zzz");	
	
		//die( dirname(dirname(dirname(__FILE__)))."/public/images/escuelamilitardecadetes2.png" );
		
		$pdf = new Zend_Pdf();
		$page = new Zend_Pdf_Page(Zend_Pdf_Page::SIZE_LETTER);
		
		$pathImage = dirname(dirname(dirname(__FILE__)))."/public/images/escuelamilitardecadetes2.png";
		$chompImage = Zend_Pdf_Image::imageWithPath($pathImage);
			
		$pageHeight = $page->getHeight();
		$pageWidth = $page->getWidth();
		$imageHeight = 200;
		$imageWidth = 200;

		$topPos = $pageHeight - 36;
		$leftPos = 36;
		$bottomPos = $topPos - $imageHeight;
		$rightPos = $leftPos + $imageWidth;

		$page->drawImage($chompImage, $leftPos, $bottomPos, $rightPos, $topPos);

		$style = new Zend_Pdf_Style();
		$style->setLineColor(new Zend_Pdf_Color_RGB(0.9, 0, 0));
		$style->setFillColor(new Zend_Pdf_Color_GrayScale(0.2));
		$style->setLineWidth(3);
		$style->setFont(Zend_Pdf_Font::fontWithName(Zend_PDF_Font::FONT_HELVETICA_BOLD) ,32);

		$page->setStyle($style)
			 ->drawText($data[0][2], $rightPos + 32, $topPos - 48);

		$page->setStyle($style)
			 ->drawText($data[1][1], $rightPos + 32, $topPos - 20);
			 
			 
		$pdf->pages[0] = ($page);

		$pdf->save("elaguna.pdf");

    }


}

