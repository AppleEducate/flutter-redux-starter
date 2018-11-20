// ListTile(
//   leading: const Icon(Icons.map),
//   title: Text(
//     'Address',
//     textScaleFactor: textScaleFactor,
//   ),
//   subtitle: _contactDetails == null
//       ? null
//       : Text(
//           _contactDetails?.address.toString().isEmpty
//               ? "No Address Found"
//               : _contactDetails?.address.toString(),
//           textScaleFactor: textScaleFactor,
//         ),
//   onTap: _contactDetails?.address.toString().isEmpty
//       ? null
//       : () => openMaps(
//           context,
//           _contactDetails?.address
//               .toString()
//               .replaceAll('\n', ' ')
//               .replaceAll(',', '')),
// ),
