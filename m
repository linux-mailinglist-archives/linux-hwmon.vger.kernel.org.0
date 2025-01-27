Return-Path: <linux-hwmon+bounces-6347-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67CA1D128
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Jan 2025 08:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDD353A3E9D
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Jan 2025 07:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2C116DEB1;
	Mon, 27 Jan 2025 07:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Uga4tXQ9"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C615A86B
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jan 2025 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737961510; cv=none; b=AtdJhY6OnZU5bmf6CTXcOUR7WfPCSDfgB2i6+qoh1UTN+7AWe9g4Q4yClC09MJuLqt4R03rWMc922+ez/swXkgKL4QabFwMPYBgoeb9Yh4/Vhp5+L9Vw4aEAhXBMo5+TBqJw8k/8OO8iM/fLpao+wVgNvW3qvKoATuZjHLSe+eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737961510; c=relaxed/simple;
	bh=n1hQVa7OMj9DeCQltzmLdaXPvo+rMa5CKu60ABJ85rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ/OKzfgExLv5ncSi3OGuz47IsjVDWPUCoFGIWgiC9nbasTlJH/Nj8OWN9L5oAi2nL1sZ32BmpbMiU6RsklpCoiWY7WWiFUfegMQW+NteGJSDc38OXjKQtq3kQABfUkJbcUbVcGoCftZ8zYqPYLMZVhjNyrfXFV4zHHrTOM6/IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Uga4tXQ9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n1hQ
	Va7OMj9DeCQltzmLdaXPvo+rMa5CKu60ABJ85rs=; b=Uga4tXQ9IZYCPmYrEwHi
	gCcacANqub7fE06Y45E9cLUFs+41mMlDJXnxsLQji7woWnG6AqgBI4CZ4SKyk3jt
	JdS+Dgt5kpQqYYkYgJ0wPQXvum9USBkuARibDYrbzgHrymYw1abfalyLJIVd+szx
	BTYMRlD0j07uKUZLw+k3j2yEMPI5SwIZkmXNeOGooca5w4+FsFxTGVzjnPpJ8EYb
	yYimP1GIXS2GLmOGd1HbNsDpjwjW8gsPKUTr+nDCucfwiIigHh7CHSUlyc/whJlg
	sUoN3w4JRaZZujXp5HXmox2J5svJq4W9CU5e3SjZOzuQY7E8NlQBcDclc6rlioAI
	4w==
Received: (qmail 138116 invoked from network); 27 Jan 2025 08:05:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 08:05:06 +0100
X-UD-Smtp-Session: l3s3148p1@2O03sqos7tIujnvm
Date: Mon, 27 Jan 2025 08:05:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC] hwmon: (pmbus/core) use the new i2c_client debugfs
 dir
Message-ID: <Z5cwIimymydU-xvT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
References: <20250123163304.46034-1-wsa+renesas@sang-engineering.com>
 <b59c8757-97d5-4d87-8648-adf27d7866f5@roeck-us.net>
 <5c87e9fe-06dc-44e2-83d5-96bd6e799a78@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rNYgNqu3xEKVMcid"
Content-Disposition: inline
In-Reply-To: <5c87e9fe-06dc-44e2-83d5-96bd6e799a78@roeck-us.net>


--rNYgNqu3xEKVMcid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I tried to implement it, but right now that doesn't work because the
> > actual debugfs files are not removed from i2c/i2c-3/3-0020 if a driver
> > is unloaded and I don't immediately see how to fix that.
> >=20
>=20
> I was able to implement this after fixing the problem in the i2c code.
> It works quite nicely.

Ok, that means once your I2C fixup patch is applied you will send out
your working version and this one can be discarded, right?


--rNYgNqu3xEKVMcid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXMCIACgkQFA3kzBSg
KbbtmhAAhLI3F8NIyAD1HLObk6A2Lbd9PloNTsVBD7U52XyE7KuO2m2ARvEObGVr
Ztp3aI6qiNi5IRhjzslDghgVhw7J6dNHb5dmIzB1Quk0rAC2zwyFwIubSuw9vkGo
6YkJTGGn4FX7y2/46wBIkygI1elCu/zK4gnm4FiZ6eAzowim5CTpH6n6t8jJp5CH
UuR4IBqKDoQVKBZY4AJBCu3j5J8sQzOnFc9Y5JQAhkTPYpIe5h/bqkBd1iAcDk8G
RYXnX5xeXT8W7ajcKSI2rJYMN5DobdcCEPSF2ykuykONfdYVNpWXraoABmL2sJ1L
amvLTa81mdXnFrcC4OnYQAQnYmEb2MUGC6xypNaYllJZsvLoUKTD3BLjxkniXo/0
4Lk9rjeoxOayUKUIkwpppcW9NCUdBfzrPtolGqU9UDGrxsr9PbOkGA4PjG1SLh4S
rDB+RRubsC20Q/2b/XCrMhtbIEvAkpC3vbcmA5/fOO7GwoBWFpLr1uB3bg7CNina
oHeHgziToK9gBYhv4YnmG1YAoVFSdXS5hQRzECxkOBCxbvOkUqCfkr+7xyguB9x7
0N/37gtdzQ9EJinfBoVJIfQ54s/VOsL8rC6ehKLCKIa0W55j3qLFeTam1X6RYind
FdHFw2/VcfIeJbfC3TIftEoja2vWvogPYIbnwrJSWr/9UCxAros=
=mLbJ
-----END PGP SIGNATURE-----

--rNYgNqu3xEKVMcid--

