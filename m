Return-Path: <linux-hwmon+bounces-7674-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DABA8361E
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Apr 2025 03:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E0BA7A748A
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Apr 2025 01:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315EF1547D2;
	Thu, 10 Apr 2025 01:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jf-bd.net header.i=@jf-bd.net header.b="q87P5/bM"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from qmt20.citechco.net (qmt20.citechco.net [203.191.33.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA946F099
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Apr 2025 01:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.191.33.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249933; cv=none; b=aB5F03x09hhi3RNaKnqPOFn2/44FLAgkeu9rKXLb4Xgdz7/1Tt6lKhPcfIulQRV0jQtpO5+vGFmDwfAn4hgWijfUODMf29dC4zC1EBim+mMr8XZEHPu5lHUfPn+DIv3w0VikJzkti3KqEyxBtrLdFjWnLc4i6/I4e0idUl7aLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249933; c=relaxed/simple;
	bh=hqskI2l0bSS7XdAaXzIxsB/kNb7inziURcq7FFqQol8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uvxsBGRxp5zQRfR40V5AGE0MUx9ZELp31KRrtXc27Flk1QTkF9gDqnPlBNCfWA/211Lfrbwyp2ypeeg0H+2KdzLeW0Dm50p6qEdl1Ob4t2Pm6c4YxLAxArViyqMgVUMyzKHjWz4SJjmzn2/WcKOrDcYd6GzP8c3PaY34QqWPa9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jf-bd.net; spf=pass smtp.mailfrom=jf-bd.net; dkim=pass (1024-bit key) header.d=jf-bd.net header.i=@jf-bd.net header.b=q87P5/bM; arc=none smtp.client-ip=203.191.33.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jf-bd.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jf-bd.net
DomainKey-Signature: a=rsa-sha1; c=nofws; d=jf-bd.net; h=reply-to:from
	:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; q=dns; s=dkim1; b=AUAqFSQAqcIYDHOl9+
	uAc5HKcmUgzwr4tlp9akEHdn6Fs1YXFp0+Fbr+Z12rKc9cPcR1n7D4GRMVd4wd/h
	VjvQKvjtRQcQdc1Nqk+ds5qCEdICC0i6wACpx1n87iE0EsZRaA+k4vq6uwhQLfia
	gmSW5AgmE+epSut1bE2kYpm9Y=
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=jf-bd.net; h=reply-to:from
	:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=dkim1; bh=BQ4VYQ759GlRs1a2EUBRjVDV
	aZ8=; b=q87P5/bMyi9H4MWI3mcZ86VVF75brcMbjNjJjB3HUhe4KrJMtbMNbXKS
	Xa5WISyx6FfYYgSMPnC5xwauivAdHr4l2rPCY+2zPzd0gqM2U2k9pro7HDcGK7CA
	zz+2FPF21Q+Q+NVlh/x80ZGFZaIMutlDyWBeA++QaUsEBcaW0bo=
Received: (qmail 25656 invoked by uid 89); 10 Apr 2025 01:52:08 -0000
Received: from unknown (HELO 179-190-173-23.cable.cabotelecom.com.br) (commercial@jf-bd.net@154.205.144.222)
  by qmt20.citechco.net with ESMTPA; 10 Apr 2025 01:52:07 -0000
Reply-To: winstontaylor@theleadingone.net
From: Winston Taylor <commercial@jf-bd.net>
To: linux-hwmon@vger.kernel.org
Subject: WTS
Date: 9 Apr 2025 20:52:05 -0500
Message-ID: <20250409205204.03695CA68FF90F2F@jf-bd.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello ,
These are available for sale. If you=E2=80=99re interested in purchasing=20=

these, please email me

brand new and original
Brand New ST8000NM017B  $70 EA
Brand New ST20000NM007D   $100 EACH
Brand New ST4000NM000A   $30 EA
Brand New WD80EFPX   $60 EA
 Brand New WD101PURZ    $70 EA

Brand New CISCO C9300-48UXM-E
Available 5
$21800 EACH

Intel Xeon Gold 5418Y Processors
QTY28 $780 each

Brand New C9200L-48T-4X-E  $1000 EAC


 Brand New N9K-C93108TC-FX-24 Nexus
9300-FX w/ 24p 100M/1/10GT & 6p 40/100G
Available 4
$3000 each

Brand New NVIDIA GeForce RTX 4090 Founders
Edition 24GB - QTY: 56 - $700 each

Brand new Palit NVIDIA GeForce RTX 5080
GamingPro OC card with full manufacturer
QTY 48 $750 EAC

BRAND NEW - ASUS TUF Gaming GeForce RTX =E2=84=A2 5080 16GB
GDDR7 OC Edition Gaming Graphics Card SEALED
QTY50  $700 EACH

Condition: Grade A
Used HP EliteBook 840 G7 i7-10610U 16GB RAM 512GB
SSD Windows 11 Pro TOUCH Screen
QTY 30 USD 100 each

Condition: Grade A
Used HP EliteBook 850 G8 15.6" FHD,
INTEL I7, 256GB SSD, 8GB RAM Win11
 QTY50 $240 EACH

SK Hynix 48GB DDR5 4800 1Rx4 PC5-4800B-
PF0-1010-XT 288pin Server EC4 RDIMM RAM
QTY 239 $50 EACH


-----------------------------------------------------------------
---------------

Best Regards,
Winston Taylor
300 Laird St, Wilkes-Barre, PA 18702, USA
Mobile: +1 (570) 890-5512
Email: winstontaylor@theleadingone.net
www.theleadingone.net

